import { Component, OnInit } from '@angular/core';
import {HttpService} from './utils/http.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

    constructor() { }

    ngOnInit() {
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
  
    } 
}
