//
//  SearchService.swift
//  LuckyTrip
//
//  Created by Ali Omari on 4/13/19.
//  Copyright © 2019 Ali Omari. All rights reserved.
//
import Alamofire
import Moya

class SearchService: BaseService<SearchUseCase> {
    func search(success: @escaping ([Room]) -> Void, failure: @escaping (_ error: Error) -> Void) {
        provider.request(.rooms(AppConfig.languageLocale ?? "")) {[weak self] (result) in
            guard let self = self else { return }
            switch result{
            case .success(let response):
                do{
                    let rooms = try response.map(RoomsResponse.self, using: self.snakeCaseDecoder).rooms
                    success(rooms)
                }catch {
                    failure(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
}
