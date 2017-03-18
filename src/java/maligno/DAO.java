/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maligno;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
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

		db.prepareStatement(sql + valores);

		int i = 0;
		for (String value : map.values()) {
			db.setString(i++, value);
		}
		db.executeUpdate();
		db.commit();
	}

	public static MeuResultSet Pesquisa(MeuPreparedStatement db, Map.Entry<String, String> e)
					throws SQLException {
		String sql = "SELECT * FROM Peido01 WHERE" + e.getKey() + "= ?";

		db.prepareStatement(sql);
		db.setString(1, e.getValue());

		return (MeuResultSet) db.executeQuery();
	}

	public static void Atualiza(MeuPreparedStatement db, Map<String, String> map)
					throws SQLException {
		String sql = "UPDATE Peido01";
		String set = "SET";
		String where = " WHERE";
		String nome = map.get("nome");

		where += "nome=?";

		for (Entry<String, String> e : map.entrySet()) {
			set += " " + e.getKey() + "= ?";
		}

		db.prepareStatement(sql + set + where);

		db.setString(1, nome);

		int i = 1;
		for (String value : map.values()) {
			db.setString(i++, value);
		}
		db.executeUpdate();
		db.commit();
	}
	
		public static void Deleta(MeuPreparedStatement db, Map<String, String> map)
					throws SQLException {
		String sql = "DELETE Peido01 WHERE";

		for (Entry<String, String> e : map.entrySet()) {
			sql += " " + e.getKey() + "= ?";
		}

		db.prepareStatement(sql);

		int i = 0;
		for (String value : map.values()) {
			db.setString(i++, value);
		}
		db.executeUpdate();
		db.commit();
	}
}
