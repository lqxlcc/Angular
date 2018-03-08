import { Component, OnInit, Input} from '@angular/core';

import {HttpService} from '../../utils/http.service';

@Component({
  selector: 'app-datagrid',
  templateUrl: './datagrid.component.html',
  styleUrls: ['./datagrid.component.scss']
})
export class DatagridComponent implements OnInit {
	@Input() config: string;
	@Input() type:string;
	constructor(private http: HttpService) { }
	api:string;
	status:number;
	dataset:Array<any>;
	delapi:string;
	ngOnInit() {
		let userid = 2;
		let parmas = {};
		parmas['userid']= userid;
		this.http.get(this.config).then((configRes) => {
			if(this.type == 'order'){
				this.api = configRes['orderApi'];
			}
			if(this.type == 'paying'){
				this.api = configRes['payingApi'];
			}
			// if(this.type == 'sending'){
			// 	this.api = configRes['sendingApi'];
			// }
			// if(this.type == 'receiving'){
			// 	this.api = configRes['receivingApi'];
			// }
			// if(this.type == 'evaluating'){
			// 	this.api = configRes['evaluatingApi'];
			// }
			this.delapi = configRes['deleteApi'];
			// console.log(configRes);
			this.http.get(this.api,parmas).then((res)=>{
				this.dataset = res['data'].results;
				this.status = res['data'].results['status'];
				// console.log(res['data'].results);
			})

		
		})
	}
	delete(idx){
	console.log(this.delapi);
		// console.log(this.dataset[idx]);
		let parmas = {};
		parmas['userid'] = this.dataset[idx].userid;
		parmas['gid'] = this.dataset[idx].id;
		parmas['orderid'] = this.dataset[idx].orderid;
		this.http.get(this.delapi,parmas).then((res)=>{
			console.log(res);
			this.dataset = res['data'].results;
		})
	}
}

