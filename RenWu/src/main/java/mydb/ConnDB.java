package mydb;

import java.sql.*;;

public class ConnDB {

		private static String dbdriver="com.mysql.cj.jdbc.Driver";
		private static String dburl="jdbc:mysql://localhost/yunleyi36?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8&useUnicode=true";
		/*
		useUnicode=true&characterEncoding=UTF-8的作用:
		1.存数据时：
		数据库在存放项目数据的时候会先用UTF-8格式将数据解码成字节码，然后再将解码后的字节码重新使用GBK编码存放到数据库中。
		2.取数据时：
		在从数据库中取数据的时候，数据库会先将数据库中的数据按GBK格式解码成字节码，然后再将解码后的字节码重新按UTF-8格式编码数据，最后再将数据返回给客户端。
		如果没有这个，条件中包含中文，可能会查询时乱码，executeupdate返回0
		*/
		private static String user="root";
		private static String pwd="123456";
		private static Connection conn=null;
		private Statement stmt=null;
		private ResultSet rs=null;

		public static Connection getConn(){
			try{
				Class.forName(dbdriver);//加载数据库驱动程序
				conn=DriverManager.getConnection(dburl,user,pwd);//创建数据库连接		
			}catch(Exception e){	
				System.out.println(e.getMessage());
				e.printStackTrace();			
			}	
			return conn;		
		}
		
		//2、数据查询方法定义	
		public  ResultSet  doQuery(String sql){
			try{
				conn=ConnDB.getConn();//创建链接
				stmt=conn.createStatement();//创建Statement
				rs=stmt.executeQuery(sql);//查询
			}catch(Exception e){
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return rs;
		}
		
		//3、数据更新方法定义
		public int doUpdate(String sql){
			int result=0;//存储影响的行数
			try{
				conn=ConnDB.getConn();
				stmt=conn.createStatement();
				result=stmt.executeUpdate(sql);
			}catch(Exception e){
				System.out.println(e.getMessage());
				e.printStackTrace();			
			}
			return result;
		}
		
		//4、 数据库资源关闭方法
		public void closeConn(){
			try{
				if(conn!=null){
					conn.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(rs!=null){
					rs.close();
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
}
