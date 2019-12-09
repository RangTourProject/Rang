package com.rang.jsp.common;

import com.oreilly.servlet.multipart.FileRenamePolicy;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyRenamePolicy implements FileRenamePolicy {

    @Override
    public File rename(File oldFile) {
        // 현재 시간을 밀리세컨 단위로 환산하여
        // 파일의 포맷 방식을 서버에 맞는 설정으로
        // 변경하여 사용하기
        // --> 201810291210_000000

        long currentTime = System.currentTimeMillis();

        System.out.println("현재시간(ms) : " + currentTime);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

        int randomNumber = (int)(Math.random()*10000);

        // 확장자 명 만 제외하고 이름 바꾸기
        String name = oldFile.getName();
        String body = null;
        String ext = null;

        // index.html ; text.txt ; image.jpg

        int dot = name.lastIndexOf(".");

        if( dot != -1) {
            // 확장자가 있는 경우
            // . 전까지 쪼개기
            body = name.substring(0, dot);

            // 확장자만 가져오기
            ext = name.substring(dot);
        } else {
            // 확장자가 없는 경우
            body = name;
            ext = "";
        }

        // 새로 변경될 파일 이름
        String fileName = sdf.format(new Date(currentTime))
                + "_" + randomNumber + ext;

        File newFile
                = new File(oldFile.getParentFile(), fileName);

        return newFile;
    }
}
