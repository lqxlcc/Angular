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
    datas:Array<object> = [];
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

        this.gid=this.route.parent.snapshot.paramMap.get('id');
        console.log(this.gid);
        //获取商品用户评价
        this.http.get('estimate',{gid:this.gid}).then((res)=>{
            
            this.datas = res['data'].results || [];
                console.log(this.datas );
            
        })



        // if(this.userId == ""){};
        //  this.http.get('product',{userid:this.userId,gid:this.gid}).then((res)=>{
          
        //       this.mData = res['data'].results;
        //       console.log(this.mData);
        // })


    }

    switchBgc(event){
        
        if(event.target.className.toLowerCase() == "estimate_l" ){
            
        }else if(event.target.className.toLowerCase() == "estimate_r"){

        }
    }
}
