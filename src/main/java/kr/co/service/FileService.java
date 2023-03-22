package kr.co.service;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	public static final String IMAGE_REPO="C:/_upload";
	public String saveFile(MultipartFile file);
}
