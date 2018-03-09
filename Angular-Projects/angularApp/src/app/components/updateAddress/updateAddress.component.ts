import { Component, OnInit, Input } from '@angular/core';
import { HttpService } from '../../utils/http.service';
import { ElMessageService } from 'element-angular';

@Component({
  selector: 'app-updateAddress',
  templateUrl: './updateAddress.component.html',
  styleUrls: ['./updateAddress.component.css']
})
export class UpdateAddressComponent implements OnInit {

  constructor(private http:HttpService,private message: ElMessageService) { }

  username: string = '';
  userphone: string = '';
  usercity: string = '';
  userroad: string = '';
  userroom: string = '';
  addressId: number;
  hasChange: boolean;


  @Input() banners: Array<string>;

  ngOnInit(){
    this.addressId = localStorage.getItem('addressId');
    this.http.get('getAddress',{addressId:this.addressId}).then(res=>{
      let data = res['data']['results'][0];
      this.username = data.name;
      this.userphone = data.phone;
      this.usercity = data.phone;
      this.userroad = data.road;
      this.userroom = data.room;
    })
  }

  submitAddress(){
    let id = localStorage.getItem('addressId');
    this.http.post('updateAddress',{id:id,username:this.username,userphone:this.userphone,usercity:this.usercity,userroad:this.userroad,userroom:this.userroom}).then(res=>{
        if(res['status']){
            this.handle1('success');
        }else{
            this.handle2('error');
        }
    })
  }

  handle1(type: string): void {
  this.message.setOptions({showClose:true,center:true})
    this.message[type]('已提交成功')
  }

  handle2(type: string): void {
  this.message.setOptions({showClose:true})
    this.message[type]('提交失败')
  }

  addressChange(event){
    if(event.target.tagName.toLowerCase() == 'input'){
      this.hasChange = true;
    }
  }

}
