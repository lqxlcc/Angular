import { Component, OnInit } from '@angular/core';
import {HttpService} from '../../utils/http.service';
import {ActivatedRoute,Router} from '@angular/router';

@Component({
  selector: 'app-merchandise',
  templateUrl: './merchandise.component.html',
  styleUrls: ['./merchandise.component.scss']
})
export class MerchandiseComponent implements OnInit {
    datas:Array<object> = [];
    gids:string;
    data:Object ={};
    times:string;
    imgs:Array<string> = [];
    shuzu:Array<any> = [0,1,2,3,4];
    constructor(private http: HttpService,private route:ActivatedRoute) { }

    ngOnInit() {
       //获取传过来的参数商品id
        this.gids = this.route.parent.snapshot.paramMap.get('id');

         this.http.get('product',{gid:this.gids}).then((res)=>{
              this.data = res['data'].results[0];
              let img = this.data['detailsimg'];
              this.imgs = img.split(",");
              console.log(this.imgs);
        })

         let now = new Date();
         let month = now.getMonth();//得到月份
         let date = now.getDate();//得到日期
         this.times = month+1 + '月' + (date+1) +'日';

         // 该商品用户评价
         this.http.get('estimate',{gid:this.gids}).then((res)=>{
            
            this.datas = res['data'].results || [];
                console.log(this.datas );
            
        })


    }

}
