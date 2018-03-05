import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-dataCarousel',
  templateUrl: './dataCarousel.component.html',
  styleUrls: ['./dataCarousel.component.css']
})
export class DataCarouselComponent implements ONInit {

  constructor() { }

  pageActive: number = 0;
  timer: number;

  @Input() banners: Array<string>;

  ngOnInit(){
    this.timer = setInterval(()=>{
        this.pageActive++;
        if(this.pageActive >= this.banners.length){
            this.pageActive = 0;
        }
    },3000)
  }

  changePage(_idx){
      clearInterval(this.timer);
      this.pageActive = _idx;
  }

}
