package com.rang.jsp.mboard.controller;

import com.oreilly.servlet.MultipartRequest;
import com.rang.jsp.common.MyRenamePolicy;
import com.rang.jsp.mboard.model.service.MBoardService;
import com.rang.jsp.mboard.model.vo.MAttachment;
import com.rang.jsp.mboard.model.vo.MBoard;
import com.sun.xml.internal.ws.api.message.Attachment;
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
import java.util.HashMap;

@WebServlet("/update.mb")
public class UpdateMBoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(!ServletFileUpload.isMultipartContent(request)){
            request.setAttribute("msg", "multipart 형식으로 전송해야 합니다.");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        }

        MBoardService ms =  new MBoardService();

        int maxSize = 1024 * 1024 * 10;

        String savePath = request.getServletContext().getResource("/resources/mBoardPhoto/").getPath();

        MultipartRequest mre = new MultipartRequest(
                request,
                savePath,
                maxSize,
                "utf-8",
                new MyRenamePolicy()
        );

        int mbno = Integer.parseInt(mre.getParameter("mbno"));

        // 기존에 있던 게시글을 가져옴
        HashMap<String, Object> originMBoard = ms.selectOne(mbno);

        ArrayList<MAttachment> list = null;

        ArrayList<String> saveFiles = new ArrayList<>();
        ArrayList<String> originFiles = new ArrayList<>();

        // form 으로 전달된 다중 파일 업로드
        Enumeration<String> files = mre.getFileNames();

        while (files.hasMoreElements()){
            String name = files.nextElement();

            saveFiles.add(mre.getFilesystemName(name));
            originFiles.add(mre.getOriginalFileName(name));
        }

        MBoard mb = (MBoard) originMBoard.get("mBoard");

        mb.setMbtitle(mre.getParameter("mbtitle"));
        mb.setMbcontent(mre.getParameter("mbcontent"));
        mb.setHashtag(mre.getParameter("hashTag"));
        mb.setLocationname(mre.getParameter("locationName"));
        mb.setTotalcost(Integer.parseInt(mre.getParameter("totalCost")));


        list = (ArrayList<MAttachment>) originMBoard.get("mAttachment");

        System.out.println(list);
        System.out.println(mb);

        for(int i = originFiles.size() -1 ; i > -1 ; i--){
            int j = originFiles.size() - i - 1 ;

            if(originFiles.get(i) != null ){ // 파일을 추가 했을 경우
                new File(savePath + list.get(j).getMchangeName()).delete(); // 기존의 내용을 가져와서 삭제 한다.

                list.get(j).setMfilePath(savePath);
                list.get(j).setMchangeName(saveFiles.get(i));
                list.get(j).setMoriginName(originFiles.get(i));
            }
        }

        int result = ms.updateMBoard(mb, list);

        if(result > 0 ){
            response.sendRedirect("selectList.mb");
        } else {
            request.setAttribute("msg", "게시글 수정 실패");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        }
    }
}
