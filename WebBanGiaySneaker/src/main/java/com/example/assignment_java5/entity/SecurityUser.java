//package com.example.assignment_java5.entity;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import java.util.Arrays;
//import java.util.Collection;
//
//public class SecurityUser implements UserDetails {
//    private NhanVien nhanVien;
//
//    public SecurityUser(NhanVien nhanVien){
//        this.nhanVien = nhanVien;
//    }
//
//    @Override
//    public String getUsername() {
//        return nhanVien.getTaiKhoan();
//    }
//
//    @Override
//    public String getPassword() {
//        return nhanVien.getMatKhau();
//    }
//
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        return Arrays.stream(nhanVien
//                        .getChucVu().getTen()
//                        .split(","))
//                .map(SimpleGrantedAuthority::new)
//                .toList();
//    }
//
//    @Override
//    public boolean isAccountNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isAccountNonLocked() {
//        return true;
//    }
//
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isEnabled() {
//        return true;
//    }
//}
