import {Http} from '@angular/http';
import {Injectable} from '@angular/core'

@Injectable()
export class CommonService{
    gid: number;
    publicDic: Object = {};

    constructor(private http: Http,gid){
        http.get('http://10.3.132.94:88/product' + gid ? '?gid=' +gid : '' ).subscribe((dicRes) => {
            this.publicDic = dicRes.json();
        })
    }
}