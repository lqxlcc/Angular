import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';

import { HttpService } from '../../utils/http.service';

@Component({
  selector: 'app-specialPull',
  templateUrl: './specialPull.component.html',
  styleUrls: ['./specialPull.component.css']
})
export class SpecialPullComponent implements OnInit {

  imgurl: string = '';
  specials: Array<Object> = [];
  endX: string;
  endY: string;

  constructor(private http:HttpService,private router:Router) {}

  ngOnInit(){
    this.imgurl = localStorage.getItem('imgurl');
    this.specials = JSON.parse(localStorage.getItem('specials'));
  }

  goStart(){
    this.endX = '';
    this.endY = '';
  }

  goMove(event){
    this.endX = event.targetTouches[0].clientX;
    this.endY = event.targetTouches[0].clientY;
  }

  goDetails(gid){
    if(!this.endX && !this.endY){
      this.router.navigate(['product/' + gid + '/merchandise']);
    }
  }

}
