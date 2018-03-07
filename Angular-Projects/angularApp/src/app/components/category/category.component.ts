import { Component, OnInit } from '@angular/core';

import { HttpService } from '../../utils/http.service';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css']
})
export class CategoryComponent implements OnInit {

  constructor(private http:HttpService) { }

  bigCate:Array<Object> = [];
  activeCate:number = 0;
  bigTypeId:number = 1;

  ngOnInit() {
    this.http.get('config/categoryconfig.txt').then(res=>{
        this.bigCate = res['data'];
    })
  }

  changeCate(_idx){
    this.activeCate = _idx;
    this.bigTypeId = this.bigCate[_idx]['bigtype'];
  }

}
