package com.rang.jsp.map.model.dao;

import com.rang.jsp.planner.model.vo.City;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static com.rang.jsp.common.JDBCTemplate.close;

public class MapDAO {

    public ArrayList<City> loadCity(Connection con) {

        ArrayList<City> list = null;

        Statement stmt = null;
        ResultSet rset = null;

        try{

            String sql = "select * from city";

            stmt = con.createStatement();
            rset = stmt.executeQuery(sql);

            list = new ArrayList<>();

            while (rset.next()){

                City c = new City();
                c.setCity_name(rset.getString(1));
                c.setLat(rset.getFloat(2));
                c.setLng(rset.getFloat(3));

                list.add(c);
            }


        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(rset);
            close(stmt);
        }

        return list;
    }
}
