package songlist.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class NCPObjectStorageService {
	private String accessKey = "1EFA4A61B686CC09620F";
	private String secretKey = "807D1FF4503BC300EFE67528EF49E3505F32AA35";
	private String regionName = "kr-standard";
	private String endPoint = "https://kr.object.ncloudstorage.com";

	final AmazonS3 s3;
	
	public NCPObjectStorageService() {
		s3 = AmazonS3ClientBuilder
				.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey,secretKey)))
				.build();
	}

	public String uploadFile(String bucketName, String directoryPath, File file) {
		//String fileName = file.getName();
		String fileName = UUID.randomUUID().toString(); //랜덤한 고유 숫자와 문자를 써서 복수 파일 형태를 없애줌
		
		FileInputStream fileIn = null; //uploadFile method를 통해 가져온 파일의 내용을 읽음
		try {
			fileIn = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		}
		
		ObjectMetadata objectMetadata = new ObjectMetadata(); //파일 정보 읽기
		//objectMetadata.setContentType("image/jpeg"); //gif, png 자체를 못읽음
		
		Path path = Paths.get(file.getAbsolutePath()); //어떤 파일타입이든 읽어올 수 있음
		String contentType = null;
		try {
			contentType = Files.probeContentType(path);
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(file.length());
		
		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName,
																directoryPath + fileName,
																fileIn,
																objectMetadata)
											.withCannedAcl(CannedAccessControlList.PublicRead); //리소스에 대한 접근 권한
											//PublicRead -> 모든 사용자가 객체를 읽을 수 있지만, 수정과 삭제는 할 수 없다
		
		
		s3.putObject(putObjectRequest); //파일 업로드
		
		return fileName;
		
	}
	
}
