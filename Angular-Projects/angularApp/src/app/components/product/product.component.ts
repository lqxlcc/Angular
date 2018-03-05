import { Component, OnInit } from '@angular/core';
import {HttpService} from '../../utils/http.service';


@Component({
  selector: 'app-root',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent implements OnInit {
    goodsId:number = 10;

    constructor(private  http: HttpService) {

    }

    ngOnInit() {
        let params = {gid:10};
        
        this.http.get('product',params).then((res)=>{
              console.log(res);

        })
       
    }

}
