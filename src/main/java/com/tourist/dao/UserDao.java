package com.tourist.dao;

import java.sql.*;
import com.tourist.dbcon.*;
import com.tourist.model.*;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public UserDao() {
		try {
			this.con = DbCon.getConnection();
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
	}

	public boolean registerUser(User user) {
		boolean status = false;
		try {
			query = "insert into users(first_name, last_name, email, phone_number, password) values(?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, user.getFirstName());
			pst.setString(2, user.getLastName());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPhoneNumber());
			pst.setString(5, user.getPassword());
			pst.executeUpdate();
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public User authenticateUser(String email, String password) {
		User user = null;
		try {
			query = "select * from users where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();

			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setPhoneNumber(rs.getString("phone_number"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean checkExistEmail(String email) {
		boolean check = false;
		try {
			query = "select count(*) as count from users where email=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			rs = pst.executeQuery();
			while (rs.next()) {
				int count = rs.getInt("count");
				if (count > 0) {
					check = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public User userInfobyId(int id) {
		User user = null;
		try {
			query = "select * from users where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setPhoneNumber(rs.getString("phone_number"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public void updateProfileInfo(User user) {
		try {
			query = "update users set first_name=?, last_name=?, phone_number=? where id=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, user.getFirstName());
			pst.setString(2, user.getLastName());
			pst.setString(3, user.getPhoneNumber());
			pst.setInt(4, user.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updatePassword(User user) {
		try {
			query = "update users set password=? where id=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, user.getPassword());
			pst.setInt(2, user.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
