package com.chenwt.modules.system.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.chenwt.common.enums.StatusEnum;
import com.chenwt.common.utils.StatusUtil;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.annotations.Where;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

/**
 * @author chenwt
 * @date 2018/8/14
 */
@Getter
@Setter
@Entity
@Table(name = "sys_menu")
@EntityListeners(AuditingEntityListener.class)
@Where(clause = StatusUtil.notDelete)
public class Menu implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long pid;
    private String pids;
    private String title;
    private String url;
    private String perms;
    private String icon;
    private Byte type;
    private Integer sort;
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

    @ManyToMany(mappedBy = "menus")
    @JsonIgnore
    private Set<Role> roles = new HashSet<>(0);

    @Transient
    @JsonIgnore
    private Map<Long, Menu> children = new HashMap<>();

    public Menu() {
    }

    public Menu(Long id, String title, String pids) {
        this.id = id;
        this.title = title;
        this.pids = pids;
    }

    public void setPids(String pids) {
        if (pids.startsWith(",")){
            pids = pids.substring(1);
        }
        this.pids = pids;
    }
}
