import { Component, OnInit,ElementRef } from '@angular/core';
import global from '../../utils/global'
import {HttpService} from '../../utils/http.service';
import {ActivatedRoute,Router} from '@angular/router'


@Component({
  selector: 'app-estimate',
  templateUrl: './estimate.component.html',
  styleUrls: ['./estimate.component.scss']
})
export class EstimateComponent implements OnInit {
    store:Object = global;
    gid:Object ={};
    mData: Object = {};
    fontSize:string = 'red';
    tabs = [
        {
          index: 1
        },
        {
          index: 2
        }
       
    ];

    constructor(private http: HttpService,private route:ActivatedRoute,private ref:ElementRef) { }

    ngOnInit() {
        console.log(this.route.parent.snapshot.paramMap.get('id'));

        //  this.gid = this.store['gid'];
        //  // console.log(this.gid);
        //  this.http.get('product',{gid:this.gid}).then((res)=>{
          
        //       // console.log(res);
        //       this.mData = res['data'].results;
        //       console.log(this.mData);
        // })
        
        
    }

}
