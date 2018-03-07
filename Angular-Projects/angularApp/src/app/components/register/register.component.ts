import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {HttpService} from '../../utils/http.service'
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  phone:string = '';
  reg: string = '';
  randomCode: number = '';
  verRandomCode:number = '';
  params:object = null;
  api: string = 'http://localhost:88/register';
  constructor(private http:HttpService,private router:Router) { }

  ngOnInit() {
  }
  goLogin(){
    this.router.navigateByUrl("login");
  }
  public tips = '获取验证码';  
  public disabled = false;  
  getCode(event: any) {  
      let number = 60;  
      this.disabled = true;  
      const that = this;  
      that.tips = number + 's后重新获取';  
    
      const timer = setInterval(function () {  
          number --;  
          if (number === 0) {  
            that.disabled = false;  
            that.tips = '获取验证码';  
            clearInterval(timer);  
          } else {  
            that.tips = number + 's后重新获取';  
          }  
      }, 1000); 
      this.randomCode=Math.floor(Math.random()*9000 +1000) ;
      this.verRandomCode = this.randomCode;

  } 
  ver(){
    const mobieReg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        this.reg =  mobieReg.test(this.phone);

  }
  saveRegister(){
  console.log(this.phone)
    this.http.post(this.api,this.params={phone:this.phone,password:this.verRandomCode}).then((res)=>{
      console.log(res);
    })
  }

}
