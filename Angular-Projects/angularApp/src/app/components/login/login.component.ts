import { Component, OnInit } from '@angular/core';

import {Router} from '@angular/router';

import {HttpService} from '../../utils/http.service';


@Component({
	selector: 'app-login',
	templateUrl: './login.component.html',
	styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
    loginStatus: string='';
    
    api: string = 'http://localhost:88/login';
    params:object = {};
    phone:string = null;
    username:string =null;
    password: string = null;
    reg: boolean;

    constructor(private http:HttpService,private router:Router) { }

    ngOnInit() {
    }
    goMine(){
      this.router.navigateByUrl("mine");
      //console.log(this.loginStatus[0].phone)

      localStorage.setItem('id', JSON.parse(JSON.stringify(this.loginStatus))[0].id);
      localStorage.setItem('phone', JSON.parse(JSON.stringify(this.loginStatus))[0].phone);
      localStorage.setItem('username', JSON.parse(JSON.stringify(this.loginStatus))[0].username);
     
    }
    goRegister(){
      this.router.navigateByUrl("register");
    }
    ver(){
        //console.log(this.phone)
        //console.log(this.password)
      this.http.get(this.api,this.params={phone:this.phone,password:this.password}).then((res)=>{
        
           this.loginStatus = JSON.parse(JSON.stringify(res));
        
       
        console.log(this.loginStatus)
        
      })
      const mobieReg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
      this.reg =  mobieReg.test(this.phone);
      
    }
		

}
