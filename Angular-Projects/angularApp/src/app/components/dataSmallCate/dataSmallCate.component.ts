import { Component, OnInit, Input, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';

import { HttpService } from '../../utils/http.service';

@Component({
  selector: 'app-dataSmallCate',
  templateUrl: './dataSmallCate.component.html',
  styleUrls: ['./dataSmallCate.component.css']
})
export class DataSmallCateComponent implements OnInit,OnDestroy {

  constructor(private http:HttpService,private router:Router) { }

  @Input() bigCate;
  @Input() activeCate;
  @Input() smallCate;
  @Input() bigTypeId;


  ngOnInit() {
  }

  ngOnDestroy(){
    sessionStorage.setItem('bigTypeId',this.bigTypeId.toString())
  }

  goList(){
    this.router.navigate(['list/'+0+"/"+this.bigTypeId]);
  }


  gotoList(_idx){
    this.router.navigate(['list/'+this.smallCate[_idx]['smalltype']+"/"+this.bigTypeId]);
  }

}