import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreatekeysComponent } from './createkeys.component';

describe('CreatekeysComponent', () => {
  let component: CreatekeysComponent;
  let fixture: ComponentFixture<CreatekeysComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreatekeysComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreatekeysComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
