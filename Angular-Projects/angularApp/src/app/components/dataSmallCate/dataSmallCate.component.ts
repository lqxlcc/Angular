import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';

import { HttpService } from '../../utils/http.service';

@Component({
  selector: 'app-dataSmallCate',
  templateUrl: './dataSmallCate.component.html',
  styleUrls: ['./dataSmallCate.component.css']
})
export class DataSmallCateComponent implements OnInit {

  constructor(private http:HttpService,private router:Router) { }

  @Input() bigCate;
  @Input() activeCate;
  @Input() smallCate;
  @Input() bigTypeId;


  ngOnInit() {
  }

  goList(){
    this.router.navigate(['list'], {
        queryParams: {
            smalltypeid:0,
            bigtypeid:this.bigTypeId
        }
    });
  }

  gotoList(_idx){
    this.router.navigate(['list'], {
        queryParams: {
            smalltypeid:this.smallCate[_idx]['smalltype'],
            bigtypeid:this.bigTypeId
        }
    });
  }

}