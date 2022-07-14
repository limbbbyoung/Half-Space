package com.halfspace.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class HandlerChat extends TextWebSocketHandler{

	// {"room_id" : 방ID, "session" : 세션}을 연달아서 저장하는 형태
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
	
	// 메세지를 맞는 방에만 뿌려주는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		super.handleTextMessage(session, message);
		
		// JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
		
		switch(mapReceive.get("cmd")) {
		// CLIENT 입장
		case "CMD_ENTER":
			// 세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("room_id", mapReceive.get("room_id"));
			map.put("session", session);
			sessionList.add(map);
			
			// 같은 채팅방에서 입장 메세지 전송
			for(int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				// room_id, session 추출
				String room_id = (String)mapSessionList.get("room_id");
				WebSocketSession sess = (WebSocketSession)mapSessionList.get("session");
				
				// 메세지를 보내야 하는 방만 얻어옴
				if(room_id.equals(mapReceive.get("room_id"))) {
					// XXX유저가 접속했다는 것을 서버쪽에 송신해 공지하도록 빈 Map을 만들고
					Map<String, String> mapToSend = new HashMap<String, String>();
					// room_id(몇 번방), cmd(입장시 처리), msg(메세지를 담아서)
					mapToSend.put("room_id", room_id);
					mapToSend.put("cmd", "CMD_ENTER");
					mapToSend.put("msg", session.getId() + "님이 입장했습니다.");
					
					// JSON으로 바꾼 후
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					// 서버로 전송
					sess.sendMessage(new TextMessage(jsonStr));
				}
				
			}
			break;
			
			// CLIENT 메세지 
		case "CMD_MSG_SEND":
			// 같은 채팅방에 메세지 전송
			for(int i = 0; i < sessionList.size(); i++) {
				// 전체 서버에 접속한 사람 목록을 가져와
				Map<String, Object> mapSessionList = sessionList.get(i);
				// 방번호 추출
				String room_id = (String) mapSessionList.get("room_id");
				// 세션 추출
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				// 접속자 중 요청받은 방에 접속해 있는 사람만
				if(room_id.equals(mapReceive.get("room_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("room_id", room_id);
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("msg", session.getId() + " : " + mapReceive.get("msg"));
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					// 데이터 전송
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
		}
	
	} // handleTextMessage end
	
	// 사용자가 접속 종료시 안내하는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		super.afterConnectionClosed(session, status);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String current_room_id = "";
		
		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String room_id = (String) map.get("room_id");
			System.out.println("사용자 연결 해제 : " + map);
			WebSocketSession sess = (WebSocketSession) map.get("session");
			
			if(session.equals(sess)) {
				current_room_id = room_id;
				sessionList.remove(map);
				break;
			}
		}
		
		// 같은 채팅방에 퇴장 메세지 전송
		for(int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessinList = sessionList.get(i);
			String room_id = (String) mapSessinList.get("room_id");
			WebSocketSession sess = (WebSocketSession) mapSessinList.get("session");
			
			if(room_id.equals(current_room_id)) {
				Map<String, String> mapToSend = new HashMap<String, String>();
				mapToSend.put("room_id", room_id);
				mapToSend.put("cmd", "CMD_EXIT");
				mapToSend.put("msg", session.getId() + "님이 퇴장했습니다.");
				
				String jsonStr = objectMapper.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(jsonStr));
			}
		}
	} // afterConnectionClosed end 
	
	
}
