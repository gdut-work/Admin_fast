package com.chenwt.admin.business.domain.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * @author chenwt
 * @date 2018/12/02
 */
@Data
@Entity
@Table(name="app_info")
public class AppInfo implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String phone;
	private String name1;
	private String name2;
	private String name3;
	private String name4;
	@CreatedDate
	private Date createDate;
}
