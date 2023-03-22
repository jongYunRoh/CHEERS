package kr.co.service;
import org.springframework.web.multipart.MultipartFile;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.io.File;
import java.nio.file.attribute.FileStoreAttributeView;
import kr.co.service.FileService;

public class FileServiceImpl implements FileService{
	public String saveFile(MultipartFile file) {//저장이미지 메소드를 만들어준다
		
		SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss-");
		
		Calendar calendar = Calendar.getInstance();
		
		String sysFileName = simpl.format(calendar.getTime()) + file.getOriginalFilename();
		
		File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
		
		try {
			file.transferTo(saveFile);//해당 위치에 파일 저장
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sysFileName;
	}
}
