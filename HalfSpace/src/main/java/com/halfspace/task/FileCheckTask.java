package com.halfspace.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.halfspace.mapper.PostAttachMapper;
import com.halfspace.persistence.PostAttachVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {

	@Autowired
	private PostAttachMapper postAttachMapper;
	
	private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	} // getFolderYesterDay END
	
	//			 초, 분, 시, 일, 달, 요일, 연도(특수)
	//          매일 새벽 2시로 설정
	@Scheduled(cron="0 0 2 * * *")
	public void checkFiles() throws Exception {
		log.warn("File Check Task run . . . . . .");
		
		log.warn(new Date());
		
		// get file list in db
		List<PostAttachVO> fileList = postAttachMapper.getOldFiles();
		
		// 파일 체크 후 경로 탐색
		List<Path> fileListPaths = fileList.stream().map(vo
				-> Paths.get("c:\\upload_data\\temp", vo.getUploadPath(),
						vo.getUuid() + "_"+ vo.getFileName())).collect(Collectors.toList());
	
		// 이미지 파일의 썸네일찾기
		fileList.stream().filter(vo -> vo.isFileType() == true)
					.map(vo -> Paths.get("c:\\upload_data\\temp", vo.getUploadPath(),
							"s_" + vo.getUuid() + "_" + vo.getFileName()))
					.forEach(p -> fileListPaths.add(p));
	
	
		log.warn("============파일 경로 forEach==============");
		fileListPaths.forEach(p-> log.warn(p));
	
		// 저장 경로 안의 어제 파일들 중 삭제해야할 파일 찾기
		File targetDir = Paths.get("c:\\upload_data\\temp", getFolderYesterDay()).toFile();
		
		// list에 저장
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		log.warn("::::::::삭제 목록 작성 후 반복문 실행:::::::::::");
		
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
		
	} // checkFiles END
	
	
	
	
	
}  // fileCheckTask class END
