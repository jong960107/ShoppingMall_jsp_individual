package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RentcarDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	//커넥션 풀을 이용한 데이터베이스 연결 
	public void getCon() {
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource)envctx.lookup("jdbc/pool");
			con = ds.getConnection();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//최신순 3대의 자동차를 리턴하는 메소드 
	public Vector<CarListBean>getSelectCar(){
		
		Vector<CarListBean> v = new Vector<>();
		getCon();
		
		try {
			String sql = "select * from sys.RentCar order by no desc";
			pstmt = con.prepareStatement(sql);
			//쿼리 실행후 결과를 Result타입으로 리턴 
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()) {
				
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
				count++;
				if(count >2)break;
				//반복문으로 빠져나가시오;
				
				
				
			}
			con.close();
			
		} catch (Exception e) {
		e.printStackTrace();	
		
		}
		return v;
	}
	
	
	//카테고리별 자동차 리스트를 저장하는 메소드 
	public Vector<CarListBean>getCategoryCar(int cate){
		
		Vector<CarListBean> v= new Vector();
		//데이터를 저장한 빈클래스 선언 
		CarListBean bean = null;
		
		getCon();
		
		try {
			
			String sql = "select * from sys.RentCar where category=?";
			pstmt = con.prepareStatement(sql);
			//?
			pstmt.setInt(1, cate);
			//결과를 리턴 
			rs = pstmt.executeQuery();
			//반복문을 돌면서 데이터를 저장 
			while(rs.next()) {
				
				//데이터를 저장할 빈클래스 생성 
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
			
				//반복문으로 빠져나가시오;
				
				
				
			}
			
			con.close();
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		return v;
		
	}
	
	//모든 차량을 검색하는 메소드 
	public Vector<CarListBean>getAllCar(){
		
		Vector<CarListBean> v= new Vector();
		//데이터를 저장한 빈클래스 선언 
		CarListBean bean = null;
		
		getCon();
		
		try {
			
			String sql = "select * from sys.RentCar";
			pstmt = con.prepareStatement(sql);
		
			//결과를 리턴 
			rs = pstmt.executeQuery();
			//반복문을 돌면서 데이터를 저장 
			while(rs.next()) {
				
				//데이터를 저장할 빈클래스 생성 
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				v.add(bean);
			
				//반복문으로 빠져나가시오;
				
				
				
			}
			
			con.close();
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		return v;
		
	
		
	}
	
	//하나의 자동차 정보를 리턴하는 메소드
	public CarListBean getOneCar(int no) {
		
		
			//리턴타입 선언 
		CarListBean bean = new CarListBean();
		getCon();
		
		try {
			String sql = "select * from RentCar where no =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
		if(rs.next()) {
				
				//데이터를 저장할 빈클래스 생성 
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
			
				//반복문으로 빠져나가시오;
				
				
				
			}
			
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bean;
	}
	
	//회원 정보가 있는지를 비교 
	public int getMember(String id,String password) {
		
		int result = 0;//0이면회원 없음 
		
		getCon();
		
		try {
			
			String sql = "select count(*) from member where id = ? and password = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				result = rs.getInt(1);//0또는 1의 값이 저장
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
		
	}
	
	//하나의 예약 정보를 저장하는 메소드 
	public void setReserveCar(CarReserveBean bean) {
		
		getCon();
		try {
			
			String sql = "insert into carreserve values(null,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//?에 값을 대입
			pstmt.setString(1, bean.getId());
			pstmt.setInt(2, bean.getNo());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4,bean.getDday());
			pstmt.setString(5, bean.getRday());
			pstmt.setInt(6, bean.getUsein());
			pstmt.setInt(7, bean.getUsewifi());
			pstmt.setInt(8, bean.getUseseat());
			pstmt.setInt(9, bean.getUsenavi());
			
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}
	
	//회원의 예약정보를 리턴하는 메서드
	public Vector<CarViewBean>getAllReserve(String id){
		
		Vector<CarViewBean>v = new Vector<>();
		CarViewBean bean = null;
		
		
		getCon();
		
		try {
			String sql = "select * from sys.RentCar natural join sys.carreserve\n"
					+ "where sysdate < to_date(rday,'YYYY-MM--DD') and id = ?";
			
			pstmt = con.prepareStatement(sql);
			//?
			pstmt.setString(1, id);
			//결과 리턴 
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				bean = new CarViewBean();
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(11));
				bean.setDday(rs.getInt(12));
				bean.setRday(rs.getString(13));
				bean.setUsein(rs.getInt(14));
				bean.setUsewifi(rs.getInt(15));
				bean.setUsenavi(rs.getInt(16));
				//빈클래스를 벡터에 저장
				v.add(bean);
				
			}
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	return v;	
	}
	
	
}
