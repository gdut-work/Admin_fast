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
@Table(name="app_command")
public class AppCommand implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String title;
	private String command;
	private String remark;

	private Integer status;
	@CreatedDate
	private Date createDate;
	@LastModifiedDate
	private Date updateDate;
}
