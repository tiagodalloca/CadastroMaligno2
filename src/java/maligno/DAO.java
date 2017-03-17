/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maligno;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author u15194
 */
public class DAO {

    public static void Inserir(MeuPreparedStatement db, Map<String, String> map) 
            throws SQLException {
        String sql = "INSERT INTO Peido01 as(";
        String valores = "(";
        for (Iterator<Map.Entry<String, String>> it = map.entrySet().iterator(); it.hasNext();) {
            sql += it.next().getKey();
            valores += "?";
            if (it.hasNext()) {
                sql += ",";
                valores += ",";
            }
        }
        sql += ")";
        valores += ")";
        int i = 0;
        for (String value : map.values()) {
            db.setString(i++, value);
        }
        db.executeUpdate();
        db.commit();
    }
}
