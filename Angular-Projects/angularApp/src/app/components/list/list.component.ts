import { Component, OnInit ,Input} from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})
export class ListComponent implements OnInit {
    // 模拟跳转传来的参数
    params:string = "奇异果";
    classify:number = 1;
    sort:string ="综合排序";

    
  constructor() { }

  ngOnInit() {

  }

}
