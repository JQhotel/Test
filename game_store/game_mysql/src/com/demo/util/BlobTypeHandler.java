package com.demo.util;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;


public class BlobTypeHandler extends BaseTypeHandler<String> {
    public void setNonNullParameter(PreparedStatement ps, int i,  
            String parameter, JdbcType jdbcType) throws SQLException {  
        ByteArrayInputStream bis;  
        try {  
            bis = new ByteArrayInputStream(parameter.getBytes("utf-8"));  
        } catch (UnsupportedEncodingException e) {  
            throw new RuntimeException("Blob Encoding Error!");  
        }     
        ps.setBinaryStream(i, bis, parameter.length());  
    }  

    @Override  
    public String getNullableResult(ResultSet rs, String columnName)  
            throws SQLException {  
        Blob blob = (Blob) rs.getBlob(columnName);  
        byte[] returnValue = null;  
        if (null != blob) {  
            returnValue = blob.getBytes(1, (int) blob.length());  
        }  
        try {  
            //��ȡ����������תΪutf-8���ַ�������
            return new String(returnValue, "utf-8");  
        } catch (UnsupportedEncodingException e) {  
            throw new RuntimeException("Blob Encoding Error!");  
        }  
    }

	@Override
	public String getNullableResult(ResultSet arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNullableResult(CallableStatement arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}  
    }
