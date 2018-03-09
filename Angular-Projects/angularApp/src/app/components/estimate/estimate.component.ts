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
    gid:string;
    mData: Object = {};
    fontSize:string = 'red';
    userId:string = "";

    tabs = [
        {
          index: 1
        },
        {
          index: 2
        }
       
    ];

    constructor(private http: HttpService,private route:ActivatedRoute,private ref:ElementRef) { }

    ngOnInit(){
        this.userId = localStorage.getItem("id");

        console.log(this.gid);
        this.gid=this.route.parent.snapshot.paramMap.get('id');

        if(this.userId == ""){};
         this.http.get('product',{userid:this.userId,gid:this.gid}).then((res)=>{
          
              this.mData = res['data'].results;
              console.log(this.mData);

        })

    }

    switchBgc(event){
        
        if(event.target.className.toLowerCase() == "estimate_l" ){
            
        }else if(event.target.className.toLowerCase() == "estimate_r"){

        }
    }
}
