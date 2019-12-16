package com.rang.jsp.like.model.service;

import com.rang.jsp.like.model.dao.LikeDAO;
import com.rang.jsp.like.model.vo.ILike;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import static com.rang.jsp.common.JDBCTemplate.*;

public class LikeService {
    Connection con;

    private LikeDAO lsdao = new LikeDAO();

    public HashMap<String, Integer> likeLogic(int memno, int mbno) {

        HashMap<String, Integer> hmap = new HashMap<>();
        int result = 0;

        con = getConnection();

        // 좋아요가 눌려 있다면
        int check = lsdao.likeCheck(con, memno, mbno);

        // 좋아요가 눌려 있지 않다면
        if(check == 0) {
            result = lsdao.updateLike(con, memno, mbno);
            hmap.put("like", 0);
        } else { // 좋아요가 눌려 있다면
            result = lsdao.updateUnLike(con, memno, mbno);
            hmap.put("like", 1);
        }

        if(result > 0) commit(con);
        else {
            rollback(con);
            hmap.put("like", -1);
        }

        close(con);

        return hmap;

    }

    // 누가 좋아요를 눌렀는가?
    public ArrayList<ILike> whoLike(int mbno) {

        con = getConnection();

        ArrayList<ILike> likeList = lsdao.whoLike(con, mbno);

        close(con);

        return likeList;
    }
}
