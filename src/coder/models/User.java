package coder.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	public boolean addNewUser(String name, String email, String password, Connection con) {

		boolean bol = false;

		PreparedStatement ps = null;

		String query = "INSERT INTO users (name,email,password) VALUES (?,?,?)";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);

			int res = ps.executeUpdate();
			bol = res == 1;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bol;
	}

	public boolean loginUser(String email, String password, Connection con) {

		boolean bol = false;

		PreparedStatement ps = null;

		String query = "SELECT * FROM users WHERE email=?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);

			ResultSet set = ps.executeQuery();
			while (set.next()) {
				if (set.getString("password").contentEquals(password)) {
					bol = true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bol;
	}
}
