package com.example.assignment_java5.security;

//import com.example.assignment_java5.response.UserRespone;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
//import java.util.Arrays;
//import java.util.Collection;
//import java.util.List;
//import java.util.stream.Collectors;
//
//
//public class MyUserDetails implements UserDetails {
//    private String email;
//    private String matKhau;
//    private List<GrantedAuthority> authorities;
//
//    public MyUserDetails(UserRespone userRespone){
//        PasswordEncoder encoder = new BCryptPasswordEncoder();
//        email = userRespone.getEmail();
//        matKhau = encoder.encode(userRespone.getMatKhau());
//        authorities = Arrays.stream(userRespone.getTenChucVu().split(","))
//                .map(SimpleGrantedAuthority::new)
//                .collect(Collectors.toList());
//    }
//
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//      return authorities;
//    }
//
//    @Override
//    public String getPassword() {
//        return matKhau;
//    }
//
//    @Override
//    public String getUsername() {
//        return email;
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
