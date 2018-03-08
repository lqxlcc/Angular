import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OrderdatailComponent } from './orderdatail.component';

describe('OrderdatailComponent', () => {
  let component: OrderdatailComponent;
  let fixture: ComponentFixture<OrderdatailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OrderdatailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OrderdatailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
