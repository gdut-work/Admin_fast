package com.chenwt.modules.system.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.chenwt.common.enums.StatusEnum;
import com.chenwt.common.utils.StatusUtil;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.*;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author chenwt
 * @date 2018/8/14
 */
@Entity
@Table(name = "sys_role")
@Getter
@Setter
@EntityListeners(AuditingEntityListener.class)
@SQLDelete(sql = "update sys_role" + StatusUtil.sliceDelete)
@Where(clause = StatusUtil.notDelete)
public class Role implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String title;
    private String remark;
    @CreatedDate
    private Date createDate;
    @LastModifiedDate
    private Date updateDate;
    @CreatedBy
    @ManyToOne(fetch = FetchType.LAZY)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "create_by")
    @JsonIgnore
    private User createBy;
    @LastModifiedBy
    @ManyToOne(fetch = FetchType.LAZY)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "update_by")
    @JsonIgnore
    private User updateBy;
    private Byte status = StatusEnum.OK.getCode();

    @ManyToMany(mappedBy = "roles", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JsonIgnore
    private Set<User> users = new HashSet<>(0);

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "sys_role_menu",
            joinColumns = @JoinColumn(name = "role_id"),
            inverseJoinColumns = @JoinColumn(name = "menu_id"))
    @JsonIgnore
    private Set<Menu> menus = new HashSet<>(0);
}
