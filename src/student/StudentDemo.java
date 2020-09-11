package student;
import java.sql.*;
public class StudentDemo {
	
	public Connection dbCon(){
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
			//Statement s= con.createStatement();
		}catch(Exception e){
			
		}
		return con;
	}
	public ResultSet display(){
		ResultSet rs = null;
		try{
			Connection con= dbCon();
			String sql="SELECT * FROM flight_details";
			PreparedStatement ps= con.prepareStatement(sql);
			rs =ps.executeQuery();
		}catch(Exception e){
			
		}
		return rs;
	}
	public ResultSet display(int id){
		ResultSet rs = null;
		try{
			Connection con= dbCon();
			String sql="SELECT * FROM flight_details WHERE id = ?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setInt(1,id);
			rs =ps.executeQuery();
		}catch(Exception e){
			
		}
		return rs;
	}
	public int update(int id,String name,String from,String to,int depdate,String deptime,String arrivtime,double fare){
		int i=0;
		try{
			Connection con= dbCon();
			String sql="UPDATE flight_details SET name= ?,fromp=?,top=?,depdate=?,deptime=?,arvtime=?,fare=? WHERE id=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, from);
			ps.setString(3, to);
			ps.setInt(4, depdate);
			ps.setString(5, deptime);
			ps.setString(6, arrivtime);
			ps.setDouble(7, fare);
			ps.setInt(8, id);
			i=ps.executeUpdate();
			if(i>0){
				return i;
			}
		}catch(Exception e){
			
		}
		return i;
	}
	public int insert(String name,String from,String to,int depdate,String deptime,String arrivtime,double fare){
		int i=0;
		Connection con;
		try{
			con= dbCon();
			String sql="INSERT INTO  flight_details(name,fromp,top,depdate,deptime,arvtime,fare) values(?,?,?,?,?,?,?)";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, from);
			ps.setString(3, to);
			ps.setInt(4, depdate);
			ps.setString(5, deptime);
			ps.setString(6, arrivtime);
			ps.setDouble(7, fare);
			i=ps.executeUpdate();
			if(i>0){
				return i;
			}
		}catch(Exception e){
			
		}
		return i;
	}
	public int delet(int id){
		int i=0;
		Connection con;
		try{
			con=dbCon();
			String sql="DELETE FROM flight_details WHERE id =?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			i=ps.executeUpdate();
			if(i>0){
				return i;
			}
		}catch(Exception e){
			
		}
		return i;
	}
	
	//Admin Section
	
	public int acheckLogin(String email,String pass){
		Connection con;
		ResultSet rs=null;
		int i=0;
		try{
			con=dbCon();
			String sql="SELECT * FROM admin WHERE email=? AND password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			if(rs.next()){
				i=1;
				return i;	
			}
		
		}catch(Exception e){
			
		}
		return i;
	}
	public int insert(String name,String email,String pass){
		int i=0;
		Connection con;
		try{
			con= dbCon();
			String sql="INSERT INTO  admin(name,email,password) values(?,?,?)";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, pass);
			i=ps.executeUpdate();
			if(i>0){
				return i;
			}
		}catch(Exception e){
			
		}
		return i;
	}
	
}
