package com.rang.jsp.mboard.controller;

import com.oreilly.servlet.MultipartRequest;
import com.rang.jsp.common.MyRenamePolicy;
import com.rang.jsp.mboard.model.service.MBoardService;
import com.rang.jsp.mboard.model.vo.MAttachment;
import com.rang.jsp.mboard.model.vo.MBoard;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet("/insert.mb")
public class InsertMBoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MBoardService mbs = new MBoardService();

        if(!ServletFileUpload.isMultipartContent(request)){

            System.out.println("mulitpart 전송아님");
            response.sendRedirect("index.jps");

//            request.setAttribute("msg", "multipart 전송이 아닙니다.");
//            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        }

        int maxSize = 1024 * 1024 * 10;

        String savePath = request.getServletContext().getRealPath("/resources/mBoardPhoto/");

        MultipartRequest mre = new MultipartRequest(
                request,
                savePath,
                maxSize,
                "UTF-8",
                new MyRenamePolicy()
        );

        // 다중 파일 업로드 처리하기
        // 배열 -> 컬렉션

        // 실제 저장될 이름
        ArrayList<String> saveFiles = new ArrayList<>();
        // 원래 파일 이름
        ArrayList<String> originFiles = new ArrayList<>();

        // Iterator의 조상을 사용하여
        // 폼이 전송한 파일의 이름들을 불러온다.
        Enumeration<String> files = mre.getFileNames();

        while (files.hasMoreElements()){
            // 파일 이름을 통해 실제 파일을 저장하며 DB에 전달할
            // changeName / originName 을 각각 추출한다.

            String name = files.nextElement();

            System.out.println("전달 받은 파일 명 : " + name);

            saveFiles.add(mre.getFilesystemName(name));
            originFiles.add(mre.getOriginalFileName(name));

        }

        // Thumbnail 객체 만들기
        MBoard mb = new MBoard();

        mb.setMbtitle(mre.getParameter("bTitle")); // 제목
        mb.setUserno(Integer.parseInt(mre.getParameter("userNo")));// 유저번호
        mb.setWriter(mre.getParameter("writer"));// 작성자 (닉네임)
        mb.setLocationname(mre.getParameter("locationName")); // 여행지
        mb.setTotalcost(Integer.parseInt(mre.getParameter("totalCost")));// 비용
        mb.setHashtag(mre.getParameter("hashTag"));// #태그
        mb.setMbcontent(mre.getParameter("mbcontent")); // 내용

        // Attachment 에 기록할 파일 리스트 생성하기

        ArrayList<MAttachment> list = new ArrayList<>();

        for(int i  = originFiles.size() - 1 ; i  > -1; i--){
            // stack 구조로 들어가기 때문에
            // 역순으로 재정렬 한다.

            MAttachment mat = new MAttachment();

            mat.setMfilePath(savePath);
            mat.setMoriginName(originFiles.get(i));
            mat.setMchangeName(saveFiles.get(i));

            System.out.println("mat확인 : " + mat);

            list.add(mat);
        }

        // 작성한 게시글 내용 mb & 사진 list를 service로 보내고 결과 받기
        int result = mbs.insertMBoard(mb, list);

        if(result > 0 ){
            response.sendRedirect("selectList.mb");

        }else {
//            request.setAttribute("msg", "게시글 작성 실패");

            // 실패 했다면 등록할 예정 이였던 파일 삭제하기
            for(int i = 0 ; i < originFiles.size() ; i++){
                File f = new File(savePath + saveFiles.get(i));

                System.out.println("파일 삭제 확인 : " + f.delete());
            }

            System.out.println("게시글 작성 실패");
            response.sendRedirect("index.jsp");
//            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        }
    }
}
