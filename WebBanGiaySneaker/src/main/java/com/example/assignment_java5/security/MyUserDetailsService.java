package com.example.assignment_java5.security;

//import com.example.assignment_java5.repository.KhachHangRepository;
//import com.example.assignment_java5.response.UserRespone;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import java.util.Optional;
//
//@Service
//public class MyUserDetailsService implements UserDetailsService {
//    @Autowired
//    private KhachHangRepository khachHangrepository;
//
//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        Optional<UserRespone> userRespone = khachHangrepository.getByEmail(email);
//        userRespone.orElseThrow(()->new UsernameNotFoundException("Not found: "+email));
//
//        return  userRespone.map(MyUserDetails::new).get();
//    }


//}
