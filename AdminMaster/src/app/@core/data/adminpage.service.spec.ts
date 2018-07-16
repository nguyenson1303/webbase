import { TestBed, inject } from '@angular/core/testing';

import { AdminpageService } from './adminpage.service';

describe('AdminpageService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [AdminpageService]
    });
  });

  it('should be created', inject([AdminpageService], (service: AdminpageService) => {
    expect(service).toBeTruthy();
  }));
});
