import { AdminpageModule } from './adminpage.module';

describe('AdminpageModule', () => {
  let adminpageModule: AdminpageModule;

  beforeEach(() => {
    adminpageModule = new AdminpageModule();
  });

  it('should create an instance', () => {
    expect(adminpageModule).toBeTruthy();
  });
});
