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
  hint: string = '';
  pShow: boolean;
  listGoods: Array<Object> = [];
  listShow: boolean;
  popup: boolean;

  ngOnInit() {
    this.history = JSON.parse(localStorage.getItem('history'));
  }

  goSmallList(){
    if(this.searchInput){
        this.http.get('fuzzySearch',{keyWord:this.searchInput}).then(res=>{
            this.listGoods = res.data.results;
            this.listShow = true;
        })
        this.history.unshift(this.searchInput);
        localStorage.setItem('history',JSON.stringify(this.history));
    }else{
        this.hint = "请输入搜索内容";
        this.pShow = !this.pShow;
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

  goSearch(){
    this.listShow = false;
  }

  clearInput(){
    this.searchInput = '';
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