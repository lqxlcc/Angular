import { Component, OnInit, Input } from '@angular/core';
import { HttpService } from '../../utils/http.service';
import { ElMessageService } from 'element-angular';

@Component({
  selector: 'app-addNewAddress',
  templateUrl: './addNewAddress.component.html',
  styleUrls: ['./addNewAddress.component.css']
})
export class AddNewAddressComponent implements OnInit {

  constructor(private http:HttpService,private message: ElMessageService) { }

  username: string = '';
  userphone: string = '';
  usercity: string = '';
  userroad: string = '';
  userroom: string = '';


  @Input() banners: Array<string>;

  ngOnInit(){
  }

  submitAddress(){
    let userid = localStorage.getItem('id');
    this.http.post('addNewAddress',{userid:userid,username:this.username,userphone:this.userphone,usercity:this.usercity,userroad:this.userroad,userroom:this.userroom}).then(res=>{
        if(res['status']){
            this.handle1('success');
            this.username = '';
            this.userphone = '';
            this.usercity = '';
            this.userroad = '';
            this.userroom = '';
        }else{
            this.handle2('error');
        }
    })
  }

  handle1(type: string): void {
  this.message.setOptions({showClose:true,center:true,customClass:'mystyle'})
    this.message[type]('已提交成功')
  }

  handle2(type: string): void {
  this.message.setOptions({showClose:true,center:true,customClass:'mystyle'})
    this.message[type]('提交失败')
  }

}
