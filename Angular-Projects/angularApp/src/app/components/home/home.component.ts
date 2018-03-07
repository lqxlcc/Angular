import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ElMessageService } from 'element-angular';

import { HttpService } from '../../utils/http.service';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

    constructor(private http: HttpService,private router:Router,private message: ElMessageService) { }

    address: string = '';
    banners: Array<string> = ['https://imgjd4.fruitday.com/images/2018-02-27/335cd282f26369758810e650c54ed247.jpg','https://imgjd5.fruitday.com/images/2018-02-28/afc5bb5589902842ef3a8e80afbb0353.jpg','https://imgjd2.fruitday.com/images/2017-11-24/830ebe6b81e6f4b058c5c1c90bd73f9b.jpg','https://imgjd1.fruitday.com/images/2018-02-27/25276a5eeb58f7803284358018f2d34d.jpg'];
    hotFruit: Array<Object> = [];
    seasonFruit: Array<Object> = [];
    meat: Array<Object> = [];
    milk:Array<Object> = [];
    moods:Array<Object> = [];
    popup: boolean;

    ngOnInit() {
        localStorage.setItem('history',JSON.stringify([]));
        let address = returnCitySN['cname'];
        let reg = /^.*省(.*市).*$/g;
        this.address = address.replace(reg,'$1');
        this.http.get('getHomeHotFruit').then(res=>{
            this.hotFruit = res['data']['results'];
        })
        this.http.get('getHomeSeasonFruit').then(res=>{
            this.seasonFruit = res['data']['results'];
        })
        this.http.get('getHomeSeafood').then(res=>{
            this.seafood = res['data']['results'];
        })
        this.http.get('getHomeMeat').then(res=>{
            this.meat = res['data']['results'];
        })
        this.http.get('getHomeMilk').then(res=>{
            this.milk = res['data']['results'];
        })
        this.http.get('getHomeMoods').then(res=>{
            this.moods = res['data']['results'];
        })
    }

    goDetails(event,gid){
      if(event.target.tagName.toLowerCase() != 'strong'){
        this.router.navigate(['product/' + gid + '/merchandise']);
      }
    }

    addCart(event){
      if(localStorage.getItem('id')){
        let id = localStorage.getItem('id');
        let gid = event.target.getAttribute('gid');
        this.http.post('addSingleGood',{userid:id,gid:gid}).then(res=>{
          if(res['status']){
            this.handle('success');
          }else{
            this.handle('error');
          }
        })
      }else{
        this.popup = true;
      }
    }

    cancelAdd(){
      this.popup = false;
    }

    sureAdd(){
      this.router.navigate(['login']);
    }

    handle(type: string): void {
    this.message.setOptions({showClose:true})
      this.message[type]('这是一条消息提示: ' + type)
    }

}
