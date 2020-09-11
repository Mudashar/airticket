package aircon;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Dblogin {
	public  Connection con;

	public  Connection dbcnn() throws SQLException{
			try{
				Class.forName("com.mysql.jdbc.Driver");
				con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
				//System.out.println("Conncted..");
			}catch(Exception e){
				//System.out.println(e);
			}
			
			return  con;
	}
	
	public String insert(String fname,String flname,String femail,String fpass) throws SQLException
	{
		PreparedStatement ps;
		con=dbcnn();
		int i=0;
		String str = null;
		try
		{
			String sql="insert into f_user(fname,lname,femail,password) values(?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, fname);
			ps.setString(2, flname);
			ps.setString(3, femail);
			ps.setString(4, fpass);
			i=ps.executeUpdate();
			if(i>0){
				str="Succesfully register";
			}else{
				str="Registration fail";
			}
		}catch(Exception e)
		{
			//System.out.println(e);
			str="Exception happen";
		}
		return str;	
	}
	
	public String insert(String fname, String pname,int pid,String depdate,String  deptime, String arvtime,double fare) throws SQLException
	{
		PreparedStatement ps;
		//con=dbcnn();
		int i=0;
		String str = null;
		try
		{
			String sql="insert into booked(name,pname,pid,depdate,deptime,arvtime,fare) values(?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, fname);
			ps.setString(2, pname);
			ps.setInt(3, pid);
			ps.setString(4,depdate );
			ps.setString(5,deptime );
			ps.setString(6,arvtime );
			ps.setDouble(7,fare);
			i=ps.executeUpdate();
			if(i>0){
				str="Succesfully booked";
			}else{
				str="Booking fail";
			}
		}catch(Exception e)
		{
			//System.out.println(e);
			str="Exception happen";
		}
		return str;	
	}
	public int login(String femail,String password) throws SQLException{
		con=dbcnn();
		try{
		PreparedStatement ps= con.prepareStatement("select femail,password from f_user");
		ResultSet rs= ps.executeQuery();
		int reg=1,pas=1;
				while(rs.next()){
					if(femail.equals(rs.getString("femail"))){
						reg=0;
						if(password.equals(rs.getString("password"))){
							//System.out.println("you 're logged in:");
							pas=0;
							return 1;
						}
					}
				}
				if(reg==1){
					return -1;		
				}
				if(reg==0 && pas==1){
					
					return 0;
		 
				}
		}catch(Exception e){
			return 2;
		}
				return 0;
				
	}

		
}
