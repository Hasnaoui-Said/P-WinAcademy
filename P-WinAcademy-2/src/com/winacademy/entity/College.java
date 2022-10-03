package com.winacademy.entity;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class College {

    private int num;
    private String name;
    private String site;
    private int idAddress;
    private Set<College> colleges;
    public College(int num, String name, String site, int idAddress) {
        this.num = num;
        this.name = name;
        this.site = site;
        this.idAddress = idAddress;
    }

    public College() {
        this.colleges = new HashSet<>();
    }
    public int add(College college){
        Iterator<College> iterator = this.colleges.iterator();
        while(iterator.hasNext()){
            College college1 = iterator.next();
            if (college1.getName().equals(college.getName()) || college.getSite().equals(college1.getSite())){
                return -1;
            }
        }
        this.colleges.add(college);
        return 1;
    }
    public College findCollegeById(int id){
        Iterator<College> iterator = this.colleges.iterator();
        while(iterator.hasNext()){
            College college = iterator.next();
            if (college.getNum() == id){
                return college;
            }
        }
        return null;
    }
    public int delete(int id){
        Iterator<College> iterator = this.colleges.iterator();
        while(iterator.hasNext()){
            College college = iterator.next();
            if (college.getNum() == id){
                this.colleges.remove(college);
                return 1;
            }
        }
        return -1;
    }
    public int update(College college){
        Iterator<College> iterator = this.colleges.iterator();
        while(iterator.hasNext()){
            College college1 = iterator.next();
            if (college.getNum() == college1.getNum()){
                college1.setName(college.getName());
                college1.setSite(college.getSite());
                college1.setIdAddress(college.getIdAddress());
                return 1;
            }
        }
        return -1;
    }

    public Set<College> getColleges() {
        return colleges;
    }

    public void setColleges(Set<College> colleges) {
        this.colleges = colleges;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int address) {
        this.idAddress = address;
    }

    @Override
    public String toString() {
        return "College{" +
                "num=" + num +
                ", name='" + name + '\'' +
                ", site='" + site + '\'' +
                ", idAddress=" + idAddress +
                '}';
    }
}
