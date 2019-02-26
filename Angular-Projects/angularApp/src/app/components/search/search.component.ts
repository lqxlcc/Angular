import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { ElMessageService } from 'element-angular';

import { HttpService } from '../../utils/http.service';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  constructor(private http:HttpService,private router:Router,private message: ElMessageService) { }

  hotSearch: Array<string> = ['橙','樱桃','苹果','火龙果','瓜'];
  searchInput: string = '';
  history: Array<string> = [];
  listGoods: Array<Object> = [];
  listShow: boolean;
  popup: boolean;
  endX: string;
  endY: string;

  ngOnInit() {
    this.history = JSON.parse(localStorage.getItem('history'));
  }

  goSmallList(){
    if(this.searchInput.trim()){
        this.http.get('fuzzySearch',{keyWord:this.searchInput}).then(res=>{
            this.listGoods = res['data']['results'];
            this.listShow = true;
        })
        if(this.history.indexOf(this.searchInput.trim()) < 0){
          this.history.unshift(this.searchInput.trim());
          localStorage.setItem('history',JSON.stringify(this.history));
        }
    }else{
        this.handle3('error');
    }
  }

  gotoSmallList(event){
    if(event.target.tagName.toLowerCase() == 'span'){
        this.searchInput = event.target.innerHTML;
        this.http.get('fuzzySearch',{keyWord:event.target.innerHTML}).then(res=>{
            this.listGoods = res['data']['results'];
            this.listShow = true;
        })
    }
  }

  goStart(){
    this.endX = '';
    this.endY = '';
  }

  goMove(event){
    this.endX = event.targetTouches[0].clientX;
    this.endY = event.targetTouches[0].clientY;
  }

  goDetails(event,gid){
    if(!this.endX && !this.endY){
      if(event.target.tagName.toLowerCase() != 'strong'){
        this.router.navigate(['product/' + gid + '/merchandise']);
      }
    }
    return;
  }

  addCart(event){
    if(localStorage.getItem('id')){
      let id = localStorage.getItem('id');
      let gid = event.target.getAttribute('gid');
      this.http.post('addSingleGood',{userid:id,gid:gid}).then(res=>{
        if(res['status']){
          this.handle1('success');
        }else{
          this.handle2('error');
        }
      })
    }else{
      this.popup = true;
    }
  }

  goSearch(){
    this.listShow = false;
  }

  clearInput(){
    this.searchInput = '';
    this.listShow = false;
  }

  cancelAdd(){
    this.popup = false;
  }

  sureAdd(){
    this.router.navigate(['login']);
  }

  handle1(type: string): void {
  this.message.setOptions({showClose:true,center:true,customClass:'mystyle'})
    this.message[type]('已提交成功');
  }

  handle2(type: string): void {
  this.message.setOptions({showClose:true,center:true,customClass:'mystyle'})
    this.message[type]('提交失败');
  }

  handle3(type: string): void {
  this.message.setOptions({showClose:true,center:true,customClass:'mystyle'})
    this.message[type]('请输入搜索内容');
  }

  clearHistory(){
      this.history = [];
      localStorage.setItem('history',JSON.stringify([]));
  }


}