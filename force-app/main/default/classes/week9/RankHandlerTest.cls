@isTest
public class RankHandlerTest {
    @isTest
    private static void rankPrizeTest() {
        RankHandler rh = new RankHandler();
        string pr = rh.rankPrize(3);
        assert.areEqual('Bronze', pr);
        string pr2 = rh.rankPrize(2);
        assert.areEqual('Silver', pr2);
        string pr3 = rh.rankPrize(1);
        assert.areEqual('Gold', pr3);

        assert.areEqual('Top 10', rh.rankPrize(6));
        assert.areEqual('Participation certificate', rh.rankPrize(11));
    }
    
    @isTest
    private static void rankPrizeSwitchTest() {
        RankHandler rh = new RankHandler();
        string pr = rh.rankPrizeSwitch(3);
        assert.areEqual('Bronze', pr);
        string pr2 = rh.rankPrizeSwitch(2);
        assert.areEqual('Silver', pr2);
        string pr3 = rh.rankPrizeSwitch(1);
        assert.areEqual('Gold', pr3);

        assert.areEqual('Top 10', rh.rankPrizeSwitch(6));
        assert.areEqual('thank you for participating', rh.rankPrizeSwitch(11));
    }

}