package com.cashrich.user.models;

import javax.persistence.*;

@Entity
@Table(name = "usertimes")
public class UserTime {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "userName", length = 100)
    private String userName;

    @Column(name = "time", length = 100)
    private String time;

    public UserTime(String userName, String time) {
        this.userName = userName;
        this.time = time;
    }

    public UserTime(){}
}
