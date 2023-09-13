package com.ict.common;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class FileRename {
	public String exec(String path, String fname) {
		File dir = new File(path);
		String[] arr = dir.list();
		
		//배열을 리스트로 만듬. 

		List<String> k = Arrays.asList(arr);
		boolean result = k.contains(fname);
		if(result) {
			// 00000.xxx
			String[] names = fname.split("\\.");
			fname = names[0] + "1." + names[1];
		}
		return fname;
	}
}
